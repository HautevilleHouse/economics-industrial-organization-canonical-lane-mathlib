import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure MarketStructurePackage where
  numberOfFirms : ℕ
  productDifferentiation : Prop
  entryBarriers : Prop
  marketPower : Prop
  concentrationIndex : ℕ → ℝ

structure MarketStructureEvidence (M : MarketStructurePackage) where
  numberOfFirmsClosed : M.numberOfFirms = 1 ∨ M.numberOfFirms > 1
  productDifferentiationClosed : M.productDifferentiation
  entryBarriersClosed : M.entryBarriers
  marketPowerClosed : M.marketPower
  concentrationIndexNonnegative : ∀ n, M.concentrationIndex n ≥ 0

def MarketStructureClosed (M : MarketStructurePackage) : Prop :=
  (M.numberOfFirms = 1 ∨ M.numberOfFirms > 1) ∧
  M.productDifferentiation ∧
  M.entryBarriers ∧
  M.marketPower ∧
  (∀ n, M.concentrationIndex n ≥ 0)

theorem market_structure_closed_from_evidence (M : MarketStructurePackage)
    (E : MarketStructureEvidence M) : MarketStructureClosed M := by
  exact And.intro E.numberOfFirmsClosed
    (And.intro E.productDifferentiationClosed
      (And.intro E.entryBarriersClosed
        (And.intro E.marketPowerClosed E.concentrationIndexNonnegative)))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse
