import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure UtilityPreferencePackage where
  consumptionSet : Type u
  preferenceRelation : consumptionSet → consumptionSet → Prop
  completeness : ∀ x y : consumptionSet, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z : consumptionSet, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  continuity : Prop
  monotonicity : Prop
  convexity : Prop

structure UtilityRepresentationPackage (U : UtilityPreferencePackage) where
  utilityFunction : U.consumptionSet → ℝ
  representationProperty : ∀ x y : U.consumptionSet, U.preferenceRelation x y ↔ utilityFunction x ≥ utilityFunction y
  continuous : Prop

structure UtilityTheoryEvidence (U : UtilityPreferencePackage) (R : UtilityRepresentationPackage U) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  monotonicityClosed : U.monotonicity
  convexityClosed : U.convexity
  representationClosed : R.representationProperty
  continuousRepClosed : R.continuous

def UtilityTheoryClosed (U : UtilityPreferencePackage) (R : UtilityRepresentationPackage U) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity ∧ U.monotonicity ∧ U.convexity ∧ R.representationProperty ∧ R.continuous

theorem utility_theory_closed_from_evidence (U : UtilityPreferencePackage) (R : UtilityRepresentationPackage U)
    (E : UtilityTheoryEvidence U R) : UtilityTheoryClosed U R :=
  And.intro E.completenessClosed (And.intro E.transitivityClosed (And.intro E.continuityClosed
    (And.intro E.monotonicityClosed (And.intro E.convexityClosed (And.intro E.representationClosed E.continuousRepClosed)))))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse