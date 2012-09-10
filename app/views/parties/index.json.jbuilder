json.partys @parties do |json, party|
	json.(party, :id, :body,:date, :time, :place)
	if party.attendrate
		json.attendrate party.attendrate
	else
		json.attendrate "0"
	end

	if party.todorate
		json.todorate party.todorate
	else
		json.todorate "0"
	end
	json.todolists party.todolists do |json, todolist|
		json.list todolist.list
	end
	json.users party.group.users do |json, user|
		unless user.role_is?(party.group, "waiting")
			json.name user.name
			if user.avatar
				json.image user.avatar.url(:thumb)
			end
		end
	end
end