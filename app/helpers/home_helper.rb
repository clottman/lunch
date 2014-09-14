module HomeHelper

	def clean_food_name(name)
		#	Vegetarian Symbols:	    * Vegan, + Lacto, - Ovo, = Lacto-Ovo
		# removing these now but they're actually important and mean things
		name.slice! '+'
		name.slice! '='

		# get rid of dashes at the end of name
		if name[name.length - 1] == '-'
			name = name[0..-2]
		end
		name	
	end

	def select_current_meal
		now = Time.current
		
		# for testing
		#now = Time.current.change(hour:15, min:30)
		current_meal = ""
		lunch_start = Time.current.change(hour:10, min:30)
		dinner_start = Time.current.change(hour:3, min:30)
		# no breakfast on weekends
		if !now.saturday? && !now.sunday? && now.minus_with_coercion(lunch_start) < 0
			current_meal = 'breakfast'
		elsif now.minus_with_coercion(dinner_start) < 0
			current_meal = 'lunch'
		else
			current_meal = 'dinner'
		end
		return current_meal
	end

end
