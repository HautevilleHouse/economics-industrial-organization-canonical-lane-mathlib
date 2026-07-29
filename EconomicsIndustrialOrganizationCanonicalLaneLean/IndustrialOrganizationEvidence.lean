import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure IndustrialOrganizationEvidencePackage where
  marketStructure : MarketStructurePackage
  strategicInteraction : StrategicInteractionPackage
  regulatoryPolicy : RegulatoryPolicyPackage
  gameTheoryApplication : GameTheoryApplicationPackage
  equilibriumFound : Prop
  welfareOptimal : Prop

structure IndustrialOrganizationEvidence (IO : IndustrialOrganizationEvidencePackage) where
  marketStructureClosed : MarketStructureClosed IO.marketStructure
  strategicInteractionClosed : StrategicInteractionClosed IO.strategicInteraction
  regulatoryPolicyClosed : RegulatoryPolicyClosed IO.regulatoryPolicy
  gameTheoryApplicationClosed : GameTheoryApplicationClosed IO.gameTheoryApplication
  equilibriumFoundClosed : IO.equilibriumFound
  welfareOptimalClosed : IO.welfareOptimal

def IndustrialOrganizationEvidenceClosed (IO : IndustrialOrganizationEvidencePackage) : Prop :=
  MarketStructureClosed IO.marketStructure ∧
  StrategicInteractionClosed IO.strategicInteraction ∧
  RegulatoryPolicyClosed IO.regulatoryPolicy ∧
  GameTheoryApplicationClosed IO.gameTheoryApplication ∧
  IO.equilibriumFound ∧
  IO.welfareOptimal

theorem industrial_organization_evidence_closed_from_evidence
  (IO : IndustrialOrganizationEvidencePackage) (E : IndustrialOrganizationEvidence IO) :
  IndustrialOrganizationEvidenceClosed IO := by
  exact And.intro E.marketStructureClosed
    (And.intro E.strategicInteractionClosed
      (And.intro E.regulatoryPolicyClosed
        (And.intro E.gameTheoryApplicationClosed
          (And.intro E.equilibriumFoundClosed E.welfareOptimalClosed))))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse
