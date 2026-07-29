import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure StrategicInteractionPackage where
  payoffMatrix : Type
  nashEquilibrium : Prop
  dominantStrategy : Prop
  priceCompetition : Prop
  quantityCompetition : Prop

structure StrategicInteractionEvidence (S : StrategicInteractionPackage) where
  payoffMatrixDefined : Nonempty S.payoffMatrix
  nashEquilibriumClosed : S.nashEquilibrium
  dominantStrategyClosed : S.dominantStrategy
  priceCompetitionClosed : S.priceCompetition
  quantityCompetitionClosed : S.quantityCompetition

def StrategicInteractionClosed (S : StrategicInteractionPackage) : Prop :=
  Nonempty S.payoffMatrix ∧ S.nashEquilibrium ∧ S.dominantStrategy ∧ S.priceCompetition ∧ S.quantityCompetition

theorem strategic_interaction_closed_from_evidence (S : StrategicInteractionPackage)
  (E : StrategicInteractionEvidence S) : StrategicInteractionClosed S := by
  exact And.intro E.payoffMatrixDefined
    (And.intro E.nashEquilibriumClosed
      (And.intro E.dominantStrategyClosed
        (And.intro E.priceCompetitionClosed E.quantityCompetitionClosed)))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse
