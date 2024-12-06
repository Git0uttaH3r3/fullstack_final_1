ActiveAdmin.register Customer do
  permit_params :name, :email, :address, :password

  form do |f|
    f.inputs "Customer Details" do
      f.input :name
      f.input :email
      f.input :address
      f.input :password
      f.input :province
    end
    f.actions
  end
end
