# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(
    name: "drawing",
    image: "drawing.png",
    text: "art created using pencils and other precision drawing utencils."
)
Genre.create!(
    name: "photography",
    image: "photography.png",
    text: "art created using cameras or light-capturing devices."
)
Genre.create!(
    name: "fashion",
    image: "fashion.png",
    text: "art created involving the pairing of different colors, fabrics, and sizes on the human body."
)
Genre.create!(
    name: "graphic design",
    image: "graphic_design.png",
    text: "art created using digital forms like computers."
)
Genre.create!(
    name: "painting",
    image: "painting.png",
    text: "art created using physical materials like acrylic or watercolor."
)
Genre.create!(
    name: "sculpture",
    image: "sculpture.png",
    text: "art created molding different types of earth."
)