% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/xml_modify.R
\name{xml_ns_strip}
\alias{xml_ns_strip}
\title{Strip the default namespaces from a document}
\usage{
xml_ns_strip(x)
}
\arguments{
\item{x}{A document, node, or node set.}
}
\description{
Strip the default namespaces from a document
}
\examples{
x <- read_xml(
  "<foo xmlns = 'http://foo.com'>
   <baz/>
   <bar xmlns = 'http://bar.com'>
     <baz/>
   </bar>
  </foo>"
)
# Need to specify the default namespaces to find the baz nodes
xml_find_all(x, "//d1:baz")
xml_find_all(x, "//d2:baz")

# After stripping the default namespaces you can find both baz nodes directly
xml_ns_strip(x)
xml_find_all(x, "//baz")
}
