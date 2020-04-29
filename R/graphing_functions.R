#' @title Plot bar plot
#'
#' @description Plots a bar plot using ggplot2.
#'
#' @param data The dataset that contains the variable to be plotted
#' @param variable The variable to be plotted
#' @param limits The minimum and maximum y values. By default, y-min set to
#' \code{0} and y-max set to \code{1000}.
#' @param title The title of the figure. By default set to \code{NULL}.
#' @param xlab The x label of the figure. By default set to \code{NULL}.
#' @param ylab The y label of the figure. By default set to \code{"Count"}.
#'
#' @export
bar_plot <- function(data, variable, limits = c(0, 1000), title = NULL, xlab = NULL, ylab = "Count"){
  pl = ggplot(data = data, aes(x = eval(parse(text = variable)), fill = eval(parse(text = variable)))) +
    geom_bar(stat = "count") + geom_text(aes(label =.data$..count..), stat = "count",
    vjust = -0.3, color = "white", size = 3.5) + theme_dark() +
    theme(panel.background = element_rect(fill = "#2D2D2D"),
          plot.title = element_text(hjust = 0.5, size = 10), axis.title = element_text(size = 7),
          legend.title = element_text(size = 7), legend.text = element_text(size = 7)) +
    scale_y_continuous(limits = limits) + labs(title = title, x = xlab, y = ylab,
                                               fill = xlab)

  if (nlevels(data[[variable]]) == 2) {
    pl = pl + guides(fill = FALSE)
  } else {
    pl = pl + theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())
  }

  if (nlevels(data[[variable]]) <= 7) {
    pl = pl + ggsci::scale_fill_tron()
  }

  return(pl)
}

#' @title Plot density plot
#'
#' @description Plots a density plot using ggplot2.
#'
#' @param data The dataset that contains the variable to be plotted
#' @param variable The variable to be plotted
#' @param title The title of the figure. By default set to \code{NULL}.
#' @param xlab The x label of the figure. By default set to \code{NULL}.
#' @param ylab The y label of the figure. By default set to \code{"Density"}.
#'
#' @export
density_plot <- function(data, variable, title = NULL, xlab = NULL, ylab = "Density"){
  pl = ggplot(data = data, aes(x = eval(parse(text = variable)))) +
    geom_density(color = "black", fill = "white") +
    theme_dark() + ggsci::scale_fill_tron() +
    theme(panel.background = element_rect(fill = "#2D2D2D"),
          plot.title = element_text(hjust = 0.5, size = 10),
          axis.title = element_text(size = 7),
          legend.title = element_text(size =7),
          legend.text = element_text(size = 7)) +
    labs(title = title, x = xlab, y = ylab, fill = xlab)

  return(pl)
}


#' @title Plot California counties
#'
#' @description Plots the California counties, filled according to a particular
#' feature.
#'
#' @param data The dataset that contains the variable to be plotted
#' @param variable The variable to be plotted
#' @param breaks The breaks for the legend. By default set to \code{NULL}
#' @param title The title of the figure. By default set to \code{NULL}
#' @param fill The fill of the figure. By default set to \code{Rates (\%)}
#' @param trans The transformation to be applied to the data. By default set
#' to \code{NULL}
#'
#' @export
map_plot <- function(data, variable, breaks = NULL,
                     title = NULL, fill = "Rates (%)", trans = NULL){
  # # If specify breaks or limits and not the other, error message prints that
  # # must specify both parameters or none.
  # if ((is.null(breaks) & !is.null(limits)) |
  #     (!is.null(breaks) & is.null(limits))){
  #   stop("Only specified breaks or limits. To specify one parameter, must
  #   specify the other parameter.")
  # }

  # Determine breaks if breaks parameters is NULL
  if (is.null(breaks)){
    # Determine min and max values
    min_v = DescTools::RoundTo(min(data[[variable]]), 5)
    max_v = DescTools::RoundTo(max(data[[variable]]), 5)
    diff = max_v - min_v

    # Based on min and max values, determine optimal breaks. We stipulate
    # that there shoud be at least five breaks
    if (diff <= 5){
      breaks = seq(min_v, max_v, 1)
    } else if (diff <= 25){
      breaks = seq(min_v, max_v, 5)
    } else {
      breaks = seq(min_v, max_v, DescTools::RoundTo(diff/5, 5))
    }

    # If the last break point is not the maximum value, add in a final break
    # point.
    last_break = breaks[length(breaks)]
    if (last_break < max_v){
      breaks = c(breaks, last_break + DescTools::RoundTo(diff/5, 5))
    }
  }

  # Get county data for CA
  counties = ggplot2::map_data("county")
  ca_county = counties %>% dplyr::filter(.data$region == 'california')

  # Combine mapping data and our data
  ca_map_vaccination = dplyr::left_join(ca_county, data, by = c("subregion" = "Jurisdiction"))

  # Create map
  ca_base = ggplot(data = ca_map_vaccination,
                   aes(x = .data$long, y = .data$lat, group = .data$group, fill = eval(parse(text = variable)))) +
    coord_quickmap() + theme_void() +
    geom_polygon(color = "black") +
    theme(plot.title = element_text(hjust = 0.5, size = 15),
          legend.title = element_text(vjust = 2, size = 10), legend.text = element_text(size = 10)) +
    labs(title = title, fill = fill)

  # Determine whether a transformation will be applied to the data
  if (is.null(trans)){
    # Default case, when trans = NULL
    ca_base = ca_base +
      viridis::scale_fill_viridis(option = "viridis",
                                  breaks = breaks,
                                  limits = c(breaks[1], breaks[length(breaks)]))
  } else {
    # Applying a transformation
    ca_base = ca_base +
      viridis::scale_fill_viridis(option = "viridis",
                                  trans  = trans,
                                  breaks = breaks,
                                  limits = c(breaks[1], breaks[length(breaks)]))
  }

  return(ca_base)
}
