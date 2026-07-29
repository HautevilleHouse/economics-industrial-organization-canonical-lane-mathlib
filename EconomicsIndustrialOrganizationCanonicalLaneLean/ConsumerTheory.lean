import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure ConsumerPreferences where
  consumptionSet : Type u
  preferenceRelation : consumptionSet → consumptionSet → Prop
  completeness : ∀ x y, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  continuity : Prop

structure UtilityRepresentation (P : ConsumerPreferences) where
  utility : P.consumptionSet → ℝ
  represents : ∀ x y, P.preferenceRelation x y ↔ utility x ≤ utility y

structure ConsumerTheoryEvidence (P : ConsumerPreferences) (U : UtilityRepresentation P) where
  completenessClosed : P.completeness
  transitivityClosed : P.transitivity
  continuityClosed : P.continuity
  utilityRepresentsClosed : U.represents

def ConsumerTheoryClosed (P : ConsumerPreferences) : Prop :=
  P.completeness ∧ P.transitivity ∧ P.continuity

theorem consumer_theory_closed_from_evidence (P : ConsumerPreferences) (E : ConsumerTheoryEvidence P (h : Nonempty (UtilityRepresentation P))) : ConsumerTheoryClosed P := by
  exact And.intro E.completenessClosed (And.intro E.transitivityClosed E.continuityClosed)

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse