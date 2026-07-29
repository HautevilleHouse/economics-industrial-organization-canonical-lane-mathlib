import EconomicsIndustrialOrganizationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure PolicyPackage where
  regulationType : String
  antitrustPolicy : Prop
  priceRegulation : Prop
  entryRegulation : Prop
  innovationPolicy : Prop
  consumerWelfareStandard : Prop
  efficiencyTradeoff : Prop

structure PolicyEvidence (P : PolicyPackage) where
  antitrustPolicyClosed : P.antitrustPolicy
  priceRegulationClosed : P.priceRegulation
  entryRegulationClosed : P.entryRegulation
  innovationPolicyClosed : P.innovationPolicy
  consumerWelfareStandardClosed : P.consumerWelfareStandard
  efficiencyTradeoffClosed : P.efficiencyTradeoff

def PolicyClosed (P : PolicyPackage) : Prop :=
  P.antitrustPolicy ∧ P.priceRegulation ∧ P.entryRegulation ∧ P.innovationPolicy ∧ P.consumerWelfareStandard ∧ P.efficiencyTradeoff

theorem policy_closed_from_evidence (P : PolicyPackage) (Ev : PolicyEvidence P) :
    PolicyClosed P := by
  exact And.intro Ev.antitrustPolicyClosed
    (And.intro Ev.priceRegulationClosed
      (And.intro Ev.entryRegulationClosed
        (And.intro Ev.innovationPolicyClosed
          (And.intro Ev.consumerWelfareStandardClosed Ev.efficiencyTradeoffClosed))))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse