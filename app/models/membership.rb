class Membership < ActiveRecord::Base
	include Workflow
		attr_accessible :user_id, :group_id, :role
		ROLES = %w(founder member waiting)

		belongs_to :user
		belongs_to :group

		validates :role,:user_id,:group_id, presence: true
		validates :role, inclusion: {in: ROLES}

		scope :founders, conditions: {role: 'founder'}

		workflow_column :role

		workflow do
			state :waiting do
				event :accept, transition_to: :member
				event :create, transition_to: :founder
			end
			state :member
			state :founder
		end
end
