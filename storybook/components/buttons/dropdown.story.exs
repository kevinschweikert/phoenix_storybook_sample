defmodule Storybook.Components.Buttons.Dropdown do
  alias PhxLiveStorybookSample.Components.Dropdown

  use PhxLiveStorybook.Story, :component

  def function, do: &Dropdown.dropdown/1
  def description, do: "A dropdown button, with a JS hook."
  def container, do: :div

  def attributes do
    [
      %Attr{id: :text, type: :string, required: true, doc: "Dropdown label"},
      %Attr{
        id: :color,
        type: :atom,
        doc: "One predefined color among a small set.",
        default: :default,
        values: ~w(default primary)a
      }
    ]
  end

  def slots do
    [
      %Slot{
        id: :entry,
        doc: "An entry in the dropdown menu. Must contain path & text attributes."
      }
    ]
  end

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default dropdown",
        attributes: %{
          text: "A dropdown"
        },
        slots: [
          ~s|<:entry path="#" text="Account settings"/>|,
          ~s|<:entry path="#" text="Support"/>|,
          ~s|<:entry path="#" text="License"/>|
        ]
      },
      %Variation{
        id: :primary_color,
        description: "A dropdown with primary color",
        attributes: %{
          text: "Primary",
          color: :primary
        },
        slots: [
          ~s|<:entry path="#" text="Account settings"/>|,
          ~s|<:entry path="#" text="Support"/>|,
          ~s|<:entry path="#" text="License"/>|
        ]
      }
    ]
  end
end
