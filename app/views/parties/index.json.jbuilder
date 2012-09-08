json.partys @parties do |json, party|
	json.(party, :id, :body,:date, :time, :place, :attendrate,:todorate)
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