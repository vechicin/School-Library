class Corrector
  def correct_name(name)
    # if name.capitalize == name
    #   return name
    # end
    capitalized_name = name.capitalize

    if capitalized_name.length > 10
      return capitalized_name[0, 10]
    end
    capitalized_name
  end
end
