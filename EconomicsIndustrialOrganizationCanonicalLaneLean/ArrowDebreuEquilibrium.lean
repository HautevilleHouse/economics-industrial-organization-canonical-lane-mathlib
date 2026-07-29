import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsIndustrialOrganizationCanonicalLaneLean.UtilityTheory

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure CommoditySpace where
  commodityType : Type u
  priceSystem : commodityType → ℝ
  endowments : commodityType → ℝ

structure ProductionSet (C : CommoditySpace) where
  productionPlans : Set (C.commodityType → ℝ)
  constantReturns : Prop
  convex : Prop
  closed : Prop

structure ArrowDebreuEconomyPackage (C : CommoditySpace) where
  consumers : Type u
  preferences : ∀ (i : consumers), UtilityPreferencePackage
  endowments : ∀ (i : consumers), C.commodityType → ℝ
  productionSector : ProductionSet C

structure ArrowDebreuEquilibriumPackage (C : CommoditySpace) (E : ArrowDebreuEconomyPackage C) where
  equilibriumPrices : C.commodityType → ℝ
  equilibriumAllocation : ∀ (i : E.consumers), C.commodityType → ℝ
  marketClearing : (∀ (i : E.consumers), equilibriumAllocation i) = E.endowments + E.productionSector.productionPlans.choose
  utilityMaximization : ∀ (i : E.consumers), UtilityRepresentationPackage (E.preferences i) ∧ 
    (∀ (bundle : C.commodityType → ℝ), (∀ (j : C.commodityType), equilibriumPrices j * bundle j ≤ equilibriumPrices j * (equilibriumAllocation i) j) → 
    UtilityRepresentationPackage.representationProperty (E.preferences i) bundle (equilibriumAllocation i))
  profitMaximization : ∀ (plan : C.commodityType → ℝ), plan ∈ E.productionSector.productionPlans →
    (∀ (j : C.commodityType), equilibriumPrices j * plan j) ≤ (∀ (j : C.commodityType), equilibriumPrices j * (E.productionSector.productionPlans.choose) j)

structure ArrowDebreuEvidence (C : CommoditySpace) (E : ArrowDebreuEconomyPackage C) (A : ArrowDebreuEquilibriumPackage C E) where
  marketClearingClosed : A.marketClearing
  utilityMaximizationClosed : A.utilityMaximization
  profitMaximizationClosed : A.profitMaximization

def ArrowDebreuEquilibriumClosed (C : CommoditySpace) (E : ArrowDebreuEconomyPackage C) (A : ArrowDebreuEquilibriumPackage C E) : Prop :=
  A.marketClearing ∧ A.utilityMaximization ∧ A.profitMaximization

theorem arrow_debreu_equilibrium_closed_from_evidence (C : CommoditySpace) (E : ArrowDebreuEconomyPackage C) (A : ArrowDebreuEquilibriumPackage C E)
    (Ev : ArrowDebreuEvidence C E A) : ArrowDebreuEquilibriumClosed C E A :=
  And.intro Ev.marketClearingClosed (And.intro Ev.utilityMaximizationClosed Ev.profitMaximizationClosed)

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse