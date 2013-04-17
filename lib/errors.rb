class CouponExpired < RuntimeError; end
class CouponNotApplicable < RuntimeError; end
class CouponRanOut < RuntimeError; end
class CouponNotFound < RuntimeError; end
class CouponAlreadyRedeemedByUser < RuntimeError; end