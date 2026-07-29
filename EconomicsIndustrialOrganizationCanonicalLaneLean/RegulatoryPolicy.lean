import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure RegulatoryPolicyPackage where
  antitrustEnforcement : Prop
  priceRegulation : Prop
  entryRegulation : Prop
  welfareAnalysis : Prop
  consumerSurplus : Prop

structure RegulatoryPolicyEvidence (R : RegulatoryPolicyPackage) where
  antitrustEnforcementClosed : R.antitrustEnforcement
  priceRegulationClosed : R.priceRegulation
  entryRegulationClosed : R.entryRegulation
  welfareAnalysisClosed : R.welfareAnalysis
  consumerSurplusClosed : R.consumerSurplus

def RegulatoryPolicyClosed (R : RegulatoryPolicyPackage) : Prop :=
  R.antitrustEnforcement ∧ R.priceRegulation ∧ R.entryRegulation ∧ R.welfareAnalysis ∧ R.consumerSurplus

theorem regulatory_policy_closed_from_evidence (R : RegulatoryPolicyPackage)
  (E : RegulatoryPolicyEvidence R) : RegulatoryPolicyClosed R := by
  exact And.intro E.antitrustEnforcementClosed
    (And.intro E.priceRegulationClosed
      (And.intro E.entryRegulationClosed
        (And.intro E.welfareAnalysisClosed E.consumerSurplusClosed)))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse
