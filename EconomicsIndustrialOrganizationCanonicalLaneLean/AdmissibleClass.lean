import EconomicsIndustrialOrganizationCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure MarketEconomy where
  agents : Type
  commodities : Type
  preferences : Type
  endowments : Type
  equilibriumPrices : Type
  allocation : Type

def ArrowDebreuExistence (M : MarketEconomy) : Prop :=
  M.equilibriumPrices ≠ Empty

structure AdmittedEconomicObject where
  economy : MarketEconomy
  equilibriumExists : Prop
  welfareTheoremsHold : Prop
  conclusion : equilibriumExists ∧ welfareTheoremsHold

structure AdmissibleClass where
  object : AdmittedEconomicObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse
