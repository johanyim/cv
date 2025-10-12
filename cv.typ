#let info = yaml("cv.yaml");
#let column_widths = (1.3cm, auto)
#import "@preview/cmarker:0.1.6"

#set text(size: 12pt)
#set page(margin: 2em)


#let date = (date_from, date_to) => {
  text(fill: luma(128))[#raw(date_from) \
    #raw(date_to)]
}

#let listof = items => for item in items {
  cmarker.render("- " + item)
}

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
  inset: (bottom: -0.5cm),
  columns: 2,
  column-gutter: 1fr,
  box()[
    #text(size: 2.5em, weight: "bold")[Johan Yim]\
    #text(size: 1.5em, fill: luma(128))[Software Developer]
  ],
)

// Links
#place(
  top + right,
  box(
    grid(
      columns: 2,
      align: horizon + left,
      column-gutter: 5pt,
      row-gutter: 5pt,
      link("https://johanyim.com")[󰇧#h(4pt) #raw("johanyim.com")],
      link("mailto:johanjyyim@gmail.com")[󰇮#h(4pt) #raw("johanjyyim@gmail.com")],

      link("tel:+447510787854")[#h(4pt) #raw("+44 7510787854")],
      link("https://linkedin.com/in/johanjyyim/")[#h(4pt) #raw("linkedin.com/in/johanjyyim")],

      [], link("https://github.com/johanyim")[#h(4pt) #raw("github.com/johanyim")],
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
      date(date_from, date_to),
      [
        #text()[= #role #text(size: 12pt, weight: "semibold", fill: luma(128), company)]
        #listof(points)
      ],
    )
  }
)


#section("Projects")
#grid(
  columns: column_widths,
  column-gutter: 10pt,
  row-gutter: 20pt,
  ..for (title, url, display_url, description, points) in info.projects {
    (
      [],
      [

        #text()[= #title #text(size: 12pt, weight: "thin", fill: luma(128), link(
          url,
        )[ #raw(display_url)])]
        #listof(points)
      ],
    )
  }
)



#section("Education")
#grid(
  columns: column_widths,
  column-gutter: 10pt,
  row-gutter: 20pt,
  ..for (title, subtitle, subjects, date_from, date_to) in info.education {
    (
      date(date_from, date_to),
      [
        #text()[= #title #text(size: 12pt, weight: "semibold", fill: luma(128), subtitle)]
        #subjects.join(" - ")
      ],
    )
  }
)

// #section("Skills")
// #grid(
//   columns: column_widths,
//   column-gutter: 10pt,
//   row-gutter: 20pt,
//   text(fill: luma(128))[],
//   info.skills.map(skill => raw(skill)).join(", ")
// )
//
