#let info = yaml("cv.yaml");
#let column_widths = (1.2cm, auto)

#set text(size: 12pt)
#set page(margin: 2em)
#set list(spacing: 1.0em)

#let section = title => box(inset: (top: 1em))[
  #grid(
    columns: (auto, 1fr),
    align: center + horizon,
    column-gutter: 6pt,
    [= #title],
    line(
      length: 100%,
      stroke: 0.7pt,
    ),
  )
]


// Header
#grid(
  columns: 2,
  column-gutter: 1fr,
  box()[
    #text(size: 2.0em, weight: "bold")[Johan Yim]
    #h(0.3em)
    #text(size: 1.6em, fill: luma(128))[Software Developer]
  ],
)

// Links
#place(
  top + right,
  box(
    outset: (y: 40cm),
    grid(
      columns: 2,
      align: horizon + left,
      column-gutter: 10pt,
      row-gutter: 5pt,
      link("https://johanyim.com")[󰇧#h(4pt) johanyim.com],
      link("mailto:johanjyyim@gmail.com")[󰇮#h(4pt) johanjyyim\@gmail.com],

      link("tel:+447510787854")[#h(4pt) +44 7510787854],
      link("https://linkedin.com/in/johanjyyim/")[#h(4pt) linkedin.com/in/johanjyyim],

      [], link("https://github.com/johanyim")[#h(4pt) github.com/johanyim],
    ),
  ),
)

#section("Experience")
#grid(
  columns: column_widths,
  column-gutter: 10pt,
  row-gutter: 20pt,
  ..for (company, location, date_from, date_to, role, points) in info.experience {
    (
      [#date_from \
        #date_to],
      [

        #text()[= #role #text(size: 12pt, weight: "semibold", fill: luma(128), company)]
        #for point in points {
          text()[
            - #point
          ]
        }],
    )
  }
)


#section("Projects")
#grid(
  columns: column_widths,
  column-gutter: 10pt,
  row-gutter: 20pt,
  ..for (title, url, description, points) in info.projects {
    (
      [ lakdsj ],
      [

        #text()[= #title #text(size: 12pt, weight: "semibold", fill: luma(128), url)]
        #for point in points {
          text()[
            - #point
          ]
        }],
    )
  }
)



#section("Education")
#grid(
  columns: column_widths,
  column-gutter: 10pt,
  row-gutter: 20pt,
  ..for (title, subtitle, subjects) in info.education {
    (
      [ lakdsj ],
      [
        #text()[= #title #text(size: 12pt, weight: "semibold", fill: luma(128), subtitle)]
        #for subject in subjects {
          text()[
            - #subject
          ]
        }],
    )
  }
)



