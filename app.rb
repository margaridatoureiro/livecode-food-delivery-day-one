require_relative "app/controllers/customers_controller"
require_relative "app/controllers/meals_controller"

require_relative "app/repositories/customer_repository"
require_relative "app/repositories/meal_repository"

require_relative "router"

MEALS_CSV_PATH = "data/meals.csv"
CUSTOMERS_CSV_PATH = "data/customers.csv"

customer_repository = CustomerRepository.new(CUSTOMERS_CSV_PATH)
meal_repository = MealRepository.new(MEALS_CSV_PATH)

customers_controller = CustomersController.new(customer_repository)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller, customers_controller)

router.run
