import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure GameTheoryApplicationPackage where
  playerSet : Type
  strategyProfiles : Type
  payoffFunctions : Type
  equilibriumConcept : Prop
  sequentialRationality : Prop
  perfectBayesianEquilibrium : Prop

structure GameTheoryApplicationEvidence (G : GameTheoryApplicationPackage) where
  playerSetNonempty : Nonempty G.playerSet
  strategyProfilesNonempty : Nonempty G.strategyProfiles
  payoffFunctionsDefined : Nonempty G.payoffFunctions
  equilibriumConceptClosed : G.equilibriumConcept
  sequentialRationalityClosed : G.sequentialRationality
  perfectBayesianEquilibriumClosed : G.perfectBayesianEquilibrium

def GameTheoryApplicationClosed (G : GameTheoryApplicationPackage) : Prop :=
  Nonempty G.playerSet ∧ Nonempty G.strategyProfiles ∧ Nonempty G.payoffFunctions ∧
  G.equilibriumConcept ∧ G.sequentialRationality ∧ G.perfectBayesianEquilibrium

theorem game_theory_application_closed_from_evidence (G : GameTheoryApplicationPackage)
  (E : GameTheoryApplicationEvidence G) : GameTheoryApplicationClosed G := by
  exact And.intro E.playerSetNonempty
    (And.intro E.strategyProfilesNonempty
      (And.intro E.payoffFunctionsDefined
        (And.intro E.equilibriumConceptClosed
          (And.intro E.sequentialRationalityClosed E.perfectBayesianEquilibriumClosed))))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse
