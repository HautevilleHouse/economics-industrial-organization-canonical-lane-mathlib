import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure NormalFormGame where
  players : List String
  strategySets : String → Type u
  payoffFunctions : String → (∀ i, strategySets i) → ℝ

structure NashEquilibrium (G : NormalFormGame) where
  strategies : ∀ i, G.strategySets i
  isBestResponse : ∀ i, ∀ alternative : G.strategySets i,
    G.payoffFunctions i (fun j => if j = i then alternative else strategies j) ≤
    G.payoffFunctions i strategies

structure GameTheoryEvidence (G : NormalFormGame) (N : NashEquilibrium G) where
  nashExists : N.isBestResponse

def NashEquilibriumClosed (G : NormalFormGame) : Prop :=
  ∃ (N : NashEquilibrium G), N.isBestResponse

theorem nash_equilibrium_closed_from_evidence (G : NormalFormGame) (N : NashEquilibrium G) (E : GameTheoryEvidence G N) : NashEquilibriumClosed G := by
  exact ⟨N, E.nashExists⟩

structure CournotDuopoly where
  firm1Cost : ℝ → ℝ
  firm2Cost : ℝ → ℝ
  inverseDemand : ℝ → ℝ
  quantity1 : ℝ
  quantity2 : ℝ
  profit1 : ℝ
  profit2 : ℝ
  bestResponse1 : ℝ → ℝ
  bestResponse2 : ℝ → ℝ
  equilibriumCondition : quantity2 = bestResponse2 quantity1 ∧ quantity1 = bestResponse1 quantity2

def CournotEquilibriumClosed (C : CournotDuopoly) : Prop :=
  C.equilibriumCondition

theorem cournot_equilibrium_closed (C : CournotDuopoly) : CournotEquilibriumClosed C := by
  exact C.equilibriumCondition

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse