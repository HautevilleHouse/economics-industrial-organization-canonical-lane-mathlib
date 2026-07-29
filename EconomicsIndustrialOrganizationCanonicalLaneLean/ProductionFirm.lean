import EconomicsIndustrialOrganizationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure ProductionPackage where
  inputSpace : Type u
  outputSpace : Type v
  productionFunction : inputSpace -> outputSpace
  profitMaximization : Prop
  costMinimization : Prop
  returnsToScale : Prop
  competitiveSupply : Prop
  factorDemand : Prop

structure ProductionEvidence (P : ProductionPackage) where
  profitMaximizationClosed : P.profitMaximization
  costMinimizationClosed : P.costMinimization
  returnsToScaleClosed : P.returnsToScale
  competitiveSupplyClosed : P.competitiveSupply
  factorDemandClosed : P.factorDemand

def ProductionClosed (P : ProductionPackage) : Prop :=
  P.profitMaximization ∧ P.costMinimization ∧ P.returnsToScale ∧ P.competitiveSupply ∧ P.factorDemand

theorem production_closed_from_evidence (P : ProductionPackage) (Ev : ProductionEvidence P) :
    ProductionClosed P := by
  exact And.intro Ev.profitMaximizationClosed
    (And.intro Ev.costMinimizationClosed
      (And.intro Ev.returnsToScaleClosed
        (And.intro Ev.competitiveSupplyClosed Ev.factorDemandClosed)))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse