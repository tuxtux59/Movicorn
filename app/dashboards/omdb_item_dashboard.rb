require "administrate/base_dashboard"

class OmdbItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
      poster_url: Field::String,
      banner_url: Field::String,
      polls: Field::HasMany,
      id: Field::Number,
      title: Field::String,
      released_date: Field::DateTime,
      released: Field::DateTime,
      runtime: Field::String.with_options(searchable: false),
      locale: Field::String,
      country: Field::String,
      kind: Field::String,
      created_at: Field::DateTime,
      updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
      :id,
      :title,
      :polls,
      :released,
      :kind,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :poster_url,
    :banner_url,
    :polls,
    :released_date,
    :released,
    :runtime,
    :locale,
    :country,
    :kind,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :polls,
    :title,
    :poster,
    :banner,
    :released_date,
    :released,
    :locale,
    :country,
    :kind,
  ].freeze

  # Overwrite this method to customize how omdb items are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(omdb_item)
    omdb_item.title
  end
end
