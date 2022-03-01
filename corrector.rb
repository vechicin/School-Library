class Corrector
  def correct_name(name)
    capitalized_name = name.capitalize

    return capitalized_name[0, 10] if capitalized_name.length > 10

    capitalized_name
  end
end
