import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure FirmBehaviorPackage where
  productionFunction : ℝ → ℝ
  costFunction : ℝ → ℝ
  profitFunction : ℝ → ℝ → ℝ
  demandFunction : ℝ → ℝ
  profitMaximizingQuantity : ℝ

structure FirmBehaviorEvidence (F : FirmBehaviorPackage) where
  productionFunctionNondecreasing : ∀ q1 q2, q1 ≤ q2 → F.productionFunction q1 ≤ F.productionFunction q2
  costFunctionNondecreasing : ∀ q1 q2, q1 ≤ q2 → F.costFunction q1 ≤ F.costFunction q2
  profitFunctionDefined : ∀ p q, F.profitFunction p q = p * F.productionFunction q - F.costFunction q
  demandFunctionNonincreasing : ∀ p1 p2, p1 ≤ p2 → F.demandFunction p2 ≤ F.demandFunction p1
  profitMaximizingCondition : F.profitFunction (F.demandFunction F.profitMaximizingQuantity) F.profitMaximizingQuantity ≥
    ∀ q, F.profitFunction (F.demandFunction q) q

def FirmBehaviorClosed (F : FirmBehaviorPackage) : Prop :=
  (∀ q1 q2, q1 ≤ q2 → F.productionFunction q1 ≤ F.productionFunction q2) ∧
  (∀ q1 q2, q1 ≤ q2 → F.costFunction q1 ≤ F.costFunction q2) ∧
  (∀ p q, F.profitFunction p q = p * F.productionFunction q - F.costFunction q) ∧
  (∀ p1 p2, p1 ≤ p2 → F.demandFunction p2 ≤ F.demandFunction p1) ∧
  (F.profitFunction (F.demandFunction F.profitMaximizingQuantity) F.profitMaximizingQuantity ≥
    ∀ q, F.profitFunction (F.demandFunction q) q)

theorem firm_behavior_closed_from_evidence (F : FirmBehaviorPackage)
    (E : FirmBehaviorEvidence F) : FirmBehaviorClosed F := by
  exact And.intro E.productionFunctionNondecreasing
    (And.intro E.costFunctionNondecreasing
      (And.intro E.profitFunctionDefined
        (And.intro E.demandFunctionNonincreasing E.profitMaximizingCondition)))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse
