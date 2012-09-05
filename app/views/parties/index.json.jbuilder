json.partys @parties do |json, party|
	json.(party, :id, :body, :date, :starttime, :endtime, :place, :attendrate,:todorate)
	json.todolists party.todolists do |json, todolist|
		json.todolist todolist.list
	end
end