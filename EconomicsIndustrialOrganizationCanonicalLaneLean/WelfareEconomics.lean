import EconomicsIndustrialOrganizationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsIndustrialOrganizationCanonicalLaneLean

structure WelfarePackage where
  socialWelfareFunction : Type u -> ℝ
  paretoEfficiency : Prop
  equityCriterion : Prop
  socialPlannerProblem : Prop
  firstWelfareTheorem : Prop
  secondWelfareTheorem : Prop
  marketFailure : Prop

structure WelfareEvidence (W : WelfarePackage) where
  paretoEfficiencyClosed : W.paretoEfficiency
  equityCriterionClosed : W.equityCriterion
  socialPlannerProblemClosed : W.socialPlannerProblem
  firstWelfareTheoremClosed : W.firstWelfareTheorem
  secondWelfareTheoremClosed : W.secondWelfareTheorem
  marketFailureClosed : W.marketFailure

def WelfareClosed (W : WelfarePackage) : Prop :=
  W.paretoEfficiency ∧ W.equityCriterion ∧ W.socialPlannerProblem ∧ W.firstWelfareTheorem ∧ W.secondWelfareTheorem ∧ W.marketFailure

theorem welfare_closed_from_evidence (W : WelfarePackage) (Ev : WelfareEvidence W) :
    WelfareClosed W := by
  exact And.intro Ev.paretoEfficiencyClosed
    (And.intro Ev.equityCriterionClosed
      (And.intro Ev.socialPlannerProblemClosed
        (And.intro Ev.firstWelfareTheoremClosed
          (And.intro Ev.secondWelfareTheoremClosed Ev.marketFailureClosed))))

end EconomicsIndustrialOrganizationCanonicalLaneLean
end HautevilleHouse