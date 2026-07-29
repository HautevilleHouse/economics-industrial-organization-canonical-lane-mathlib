import EconomicsIndustrialOrganizationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure GameTheoryPackage where
  players : Type u
  strategies : players -> Type v
  payoffs : (p : players) -> strategies p -> ℝ
  nashEquilibrium : Prop
  dominantStrategy : Prop
  subgamePerfectEquilibrium : Prop
  bayesianNashEquilibrium : Prop
  efficientOutcome : Prop

structure GameTheoryEvidence (G : GameTheoryPackage) where
  nashEquilibriumClosed : G.nashEquilibrium
  dominantStrategyClosed : G.dominantStrategy
  subgamePerfectEquilibriumClosed : G.subgamePerfectEquilibrium
  bayesianNashEquilibriumClosed : G.bayesianNashEquilibrium
  efficientOutcomeClosed : G.efficientOutcome

def GameTheoryClosed (G : GameTheoryPackage) : Prop :=
  G.nashEquilibrium ∧ G.dominantStrategy ∧ G.subgamePerfectEquilibrium ∧ G.bayesianNashEquilibrium ∧ G.efficientOutcome

theorem game_theory_closed_from_evidence (G : GameTheoryPackage) (Ev : GameTheoryEvidence G) :
    GameTheoryClosed G := by
  exact And.intro Ev.nashEquilibriumClosed
    (And.intro Ev.dominantStrategyClosed
      (And.intro Ev.subgamePerfectEquilibriumClosed
        (And.intro Ev.bayesianNashEquilibriumClosed Ev.efficientOutcomeClosed)))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse