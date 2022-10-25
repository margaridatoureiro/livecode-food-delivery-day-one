require_relative "../views/customer_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomerView.new
  end

  def add 
    # Ask the user for a name
    name = @view.ask_user_for(:name)
    # Ask the user for an address
    address = @view.ask_user_for(:address)
    # Create an instance of Customer
    customer = Customer.new(name: name, address: address)
    # Give the customer to the cutomer repository
    @customer_repository.create(customer)
  end

  def list 
    # Grab all the customers from the customer repository
    customers = @customer_repository.all
    # Give them to the view to display them
    @view.display(customers)
  end
end
