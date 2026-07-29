import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure AssetPricingModel where
  assetSpace : Type u
  payoff : assetSpace → ℝ
  price : assetSpace → ℝ
  stochasticDiscountFactor : assetSpace → ℝ
  riskFreeRate : ℝ

structure CAPMPackage (A : AssetPricingModel) where
  marketPortfolio : A.assetSpace
  beta : A.assetSpace → ℝ
  expectedReturn : A.assetSpace → ℝ
  securityMarketLine : ∀ (x : A.assetSpace), A.price x = (A.stochasticDiscountFactor x) * A.payoff x
  capmEquation : ∀ (x : A.assetSpace), A.expectedReturn x = A.riskFreeRate + A.beta x * (A.expectedReturn A.marketPortfolio - A.riskFreeRate)

structure CAPMEvidence (A : AssetPricingModel) (C : CAPMPackage A) where
  securityMarketLineClosed : C.securityMarketLine
  capmEquationClosed : C.capmEquation

def CAPMClosed (A : AssetPricingModel) (C : CAPMPackage A) : Prop :=
  C.securityMarketLine ∧ C.capmEquation

theorem capm_closed_from_evidence (A : AssetPricingModel) (C : CAPMPackage A) (E : CAPMEvidence A C) : CAPMClosed A C :=
  And.intro E.securityMarketLineClosed E.capmEquationClosed

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse