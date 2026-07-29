import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure SolowGrowthPackage where
  capitalStock : Type u
  output : capitalStock → ℝ
  savingsRate : ℝ
  depreciationRate : ℝ
  laborForceGrowthRate : ℝ
  technologicalProgressRate : ℝ
  initialCapital : capitalStock

structure SolowGrowthDynamicsPackage (S : SolowGrowthPackage) where
  capitalAccumulationEquation : Prop
  steadyStateCapital : S.capitalStock
  convergenceCondition : Prop
  balancedGrowthPath : Prop

structure SolowGrowthEvidence (S : SolowGrowthPackage) (D : SolowGrowthDynamicsPackage S) where
  capitalAccumulationClosed : D.capitalAccumulationEquation
  steadyStateClosed : ∃ (k : S.capitalStock), D.steadyStateCapital = k ∧ S.depreciationRate * k = S.savingsRate * S.output k
  convergenceClosed : D.convergenceCondition
  balancedGrowthClosed : D.balancedGrowthPath

def SolowGrowthClosed (S : SolowGrowthPackage) (D : SolowGrowthDynamicsPackage S) : Prop :=
  D.capitalAccumulationEquation ∧ (∃ (k : S.capitalStock), D.steadyStateCapital = k ∧ S.depreciationRate * k = S.savingsRate * S.output k) ∧ D.convergenceCondition ∧ D.balancedGrowthPath

theorem solow_growth_closed_from_evidence (S : SolowGrowthPackage) (D : SolowGrowthDynamicsPackage S) (E : SolowGrowthEvidence S D) : SolowGrowthClosed S D :=
  And.intro E.capitalAccumulationClosed (And.intro E.steadyStateClosed (And.intro E.convergenceClosed E.balancedGrowthClosed))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse