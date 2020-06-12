# frozen_string_literal: true

module Types
  include Dry::Types.module
  # Dry types
  module Reform
    Time = Dry::Types['params.time_zone']
    Date = Types::Nil | Types::Date | Types::Params::Date | Types::String
  end
end
