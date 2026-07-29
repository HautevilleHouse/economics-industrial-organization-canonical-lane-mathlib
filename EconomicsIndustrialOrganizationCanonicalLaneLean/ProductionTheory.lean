import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure ProductionSet where
  inputSpace : Type u
  outputSpace : Type v
  productionPossibilities : Set (inputSpace × outputSpace)
  freeDisposal : Prop
  convexity : Prop
  closedness : Prop

structure ProfitMaximization (P : ProductionSet) where
  priceInput : P.inputSpace → ℝ
  priceOutput : P.outputSpace → ℝ
  optimalPlan : P.inputSpace × P.outputSpace
  profitDefined : ℝ
  isOptimal : ∀ (plan : P.inputSpace × P.outputSpace), plan ∈ P.productionPossibilities → profitDefined ≥ priceOutput plan.2 - priceInput plan.1

structure ProductionTheoryEvidence (P : ProductionSet) (M : ProfitMaximization P) where
  freeDisposalClosed : P.freeDisposal
  convexityClosed : P.convexity
  closednessClosed : P.closedness
  optimalClosed : M.isOptimal

def ProductionTheoryClosed (P : ProductionSet) : Prop :=
  P.freeDisposal ∧ P.convexity ∧ P.closedness

theorem production_theory_closed_from_evidence (P : ProductionSet) (E : ProductionTheoryEvidence P (h : Nonempty (ProfitMaximization P))) : ProductionTheoryClosed P := by
  exact And.intro E.freeDisposalClosed (And.intro E.convexityClosed E.closednessClosed)

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse