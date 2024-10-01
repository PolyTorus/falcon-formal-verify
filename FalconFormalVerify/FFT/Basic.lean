import Mathlib.Data.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Algebra.Group.Defs
import Mathlib.Data.Complex.Exponential
import Mathlib.Analysis.Complex.Basic

open Complex

noncomputable def ω (n : ℕ) : ℂ := exp (2 * Real.pi * I / n)

theorem ω_unit_circle (n: ℕ) (hn: n > 0) : abs (ω n) = 1 := sorry

theorem ω_pow (n: ℕ) (hn: n > 0) : ∀ k: ℕ, (ω n)^k = exp (2 * Real.pi * I * k / n) := sorry
