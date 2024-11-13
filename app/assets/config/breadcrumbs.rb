crumb :root do
  link "Home", root_path
end

# Lego Sets index page
crumb :lego_sets do
  link "Lego Sets", lego_sets_path
  parent :root
end

# Individual Lego Set page
crumb :lego_set do |lego_set|
  link lego_set.title, lego_set_path(lego_set)
  parent :lego_sets
end

# Example for another page, such as cart or checkout
crumb :cart do
  link "Cart", cart_path
  parent :root
end