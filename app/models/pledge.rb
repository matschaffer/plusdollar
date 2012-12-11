class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_accessible :amount, :title, :issue_url, :user_id, :user, :project_id

  validates :amount, presence: true

  scope :pricey, where('amount > ?', 10)
  scope :top_ten, order('amount desc').limit(10)

  def user_name
    user.name if user
  end

  def cents
    (amount * 100).to_i
  end

  def charge_card(card)
    charge = Stripe::Charge.create(
      amount: cents,
      currency: "usd",
      card: card,
      description: "Pledge for #{title}"
    )
  end

  def github_issue user, project, id
    Github.new.issues.get(user, project, id)
  end

  def load_title_from_github
    uri = URI.parse(issue_url)
    user, project, _, id = uri.path.split('/').drop(1)
    self.title = github_issue(user, project, id).title
  end
end
