import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure CollusionPackage where
  numberFirms : ℕ
  discountFactor : ℝ
  punishmentProfit : ℝ
  collusiveProfit : ℝ
  deviationProfit : ℝ
  triggerStrategy : Prop

structure CollusionEvidence (C : CollusionPackage) where
  discountFactorBetweenZeroAndOne : 0 ≤ C.discountFactor ∧ C.discountFactor ≤ 1
  punishmentProfitNonnegative : C.punishmentProfit ≥ 0
  collusiveProfitPositive : C.collusiveProfit > 0
  deviationProfitPositive : C.deviationProfit > 0
  triggerStrategyCredible : C.triggerStrategy
  icCondition : C.collusiveProfit / (1 - C.discountFactor) ≥ C.deviationProfit + C.discountFactor * C.punishmentProfit / (1 - C.discountFactor)

def CollusionClosed (C : CollusionPackage) : Prop :=
  (0 ≤ C.discountFactor ∧ C.discountFactor ≤ 1) ∧
  C.punishmentProfit ≥ 0 ∧
  C.collusiveProfit > 0 ∧
  C.deviationProfit > 0 ∧
  C.triggerStrategy ∧
  (C.collusiveProfit / (1 - C.discountFactor) ≥ C.deviationProfit + C.discountFactor * C.punishmentProfit / (1 - C.discountFactor))

theorem collusion_closed_from_evidence (C : CollusionPackage)
    (E : CollusionEvidence C) : CollusionClosed C := by
  exact And.intro E.discountFactorBetweenZeroAndOne
    (And.intro E.punishmentProfitNonnegative
      (And.intro E.collusiveProfitPositive
        (And.intro E.deviationProfitPositive
          (And.intro E.triggerStrategyCredible E.icCondition))))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse
