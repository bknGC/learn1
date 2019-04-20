class CategoriesController < ApplicationController
  # POST /categories
  #
  # Вспомогательный метод cat_params() я сделал
  # чтобы контролировать входящие параметры и сформировать белый список
  # разрешенных параметров, остальные будут игнорироваться.
  def create
    category = Category.new(cat_params)
    if category.save
      category = find_category(category.id)
      render json: category, status: 201
    else
      # Что-то пошло не так...
      render json: {errors: category.errors}, status: :unprocessable_entity
    end
  end

  # GET /categories
  #
  # Добавляю в контроллер метод Index
  def index
    categories = Category.left_outer_joins(:products)
    .select('categories.id, categories.name, COUNT(products.id) AS products_count')
    .group('categories.id, categories.name')
    render json: categoriees, status: :ok
  end


  # GET /categories/:id
  #
  # Добавляю метод show, для чтения одной категории
  def show
    category = find_category(params[:id])
    render json: category, status: :ok
  end

  # Изменение существующей категории (Update). Запрос PUT /categories/id
  #
  # Добавлю в контроллер метод Update
  def update
    category = Category.find(params[:id])
    if category.update_attributes(cat_params)
      render json: category, status: :ok
      # Если что-то не так
      render json: {errors: category.errors}, status: :unprocessable_entity
    end
  end

  # Удаление категории (Delete). Запрос DELETE /categories/id
  # Добавляем в контроллер метод Destroy
  def destroy
    category = Category.find(params[:id])
    category.destroy
    render json:category, status: 204
  end



  # Далее создам методы по каждому пункту из постановки задачи.
  #
  # Создание нового продукта в категории (Create). Запрос POST /categories/3/products
  # POST /categories/:category_id/products
  def create
    product = find_category(params[:category_id]).products.new(prod_params)
    if product.save
      product = find_product(product.id)
      render json: product, status: 201
    else
      render json: {errors: product.errors}
    end
  end


private
  def cat_params
     params.require(:category).permit(:name)
  end

  def find_category id
    Category.left_outer_joins(:products)
        .select('categories.id, categories.name, COUNT(products.id) AS products_count')
        .where(id: d)
        .group('categories.id, categories.name')
  end


end
