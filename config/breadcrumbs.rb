crumb :root do
  link "Home", root_path
end

crumb :lego_sets do
  link "Lego Sets", lego_sets_path
  parent :root
end