import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure ArrowDebreuEquilibrium where
  commoditySpace : Type u
  priceSystem : commoditySpace → ℝ
  endowments : Type v → commoditySpace
  preferences : Type v → commoditySpace → Prop
  utilityFunctions : Type v → commoditySpace → ℝ
  productionSets : Type w → Set commoditySpace
  profitMaximization : Prop
  utilityMaximization : Prop
  marketClearing : Prop
  existenceProof : Prop

structure GeneralEquilibriumEvidence (G : ArrowDebreuEquilibrium) where
  profitMaximizationClosed : G.profitMaximization
  utilityMaximizationClosed : G.utilityMaximization
  marketClearingClosed : G.marketClearing

def GeneralEquilibriumClosed (G : ArrowDebreuEquilibrium) : Prop :=
  G.profitMaximization ∧ G.utilityMaximization ∧ G.marketClearing

theorem general_equilibrium_closed_from_evidence (G : ArrowDebreuEquilibrium)
    (E : GeneralEquilibriumEvidence G) : GeneralEquilibriumClosed G := by
  exact And.intro E.profitMaximizationClosed
    (And.intro E.utilityMaximizationClosed E.marketClearingClosed)

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse