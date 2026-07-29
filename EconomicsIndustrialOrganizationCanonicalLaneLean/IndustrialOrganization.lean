import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure MarketStructure where
  firms : Type u
  products : Type v
  costFunction : firms → (firms → ℝ) → ℝ
  demandFunction : (firms → ℝ) → (firms → ℝ)
  numberOfFirms : ℕ

structure CournotCompetitionPackage (M : MarketStructure) where
  quantityChoices : M.firms → ℝ
  profitFunction : M.firms → ℝ
  bestResponse : M.firms → ℝ → ℝ
  nashEquilibrium : ∀ (i : M.firms), M.profitFunction i = M.demandFunction (fun (j : M.firms) => M.costFunction j M.quantityChoices) i * M.quantityChoices i - M.costFunction i M.quantityChoices ∧
    (∀ (q : ℝ), M.profitFunction i ≥ M.demandFunction (fun (j : M.firms) => if j = i then q else M.quantityChoices j) i * q - M.costFunction i (fun (j : M.firms) => if j = i then q else M.quantityChoices j))

structure CournotEvidence (M : MarketStructure) (C : CournotCompetitionPackage M) where
  nashEquilibriumClosed : C.nashEquilibrium

def CournotEquilibriumClosed (M : MarketStructure) (C : CournotCompetitionPackage M) : Prop :=
  C.nashEquilibrium

theorem cournot_equilibrium_closed_from_evidence (M : MarketStructure) (C : CournotCompetitionPackage M) (E : CournotEvidence M C) : CournotEquilibriumClosed M C :=
  E.nashEquilibriumClosed

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse