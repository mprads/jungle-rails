module ApplicationHelper
  # TODO put in its own helper module
  def formatted_review(product)
    tot_rating = product.total_rating
    num_reviews  = product.reviews.size
    "#{tot_rating / num_reviews}/5 - #{num_reviews} reviews"
  end
end
