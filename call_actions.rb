class Actions
    def call_actions(option, app)
        case option
        when 1
          list_books(app)
        when 2
          list_people(app)
        when 3
          create_person(app)
        when 4
          create_book(app)
        when 5
          create_rental(app)
        when 6
          list_rentals_by_id(app)
        end
      end
end