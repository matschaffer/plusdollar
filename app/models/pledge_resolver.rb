class PledgeResolver
  def resolve_pledges pledges=Pledge.unresolved
    pledges.each do |pledge|
      pledge.load_state_from_github
    end
  end
end
