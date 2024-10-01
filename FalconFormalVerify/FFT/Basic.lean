import Mathlib.Data.Complex.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
import Mathlib.Algebra.Group.Defs
import Mathlib.Data.Complex.Exponential
import Mathlib.Analysis.Complex.Basic
import Mathlib.Data.Vector.Basic

open Complex

noncomputable def ω (n : ℕ) : ℂ := exp (2 * Real.pi * I / n)

theorem ω_unit_circle (n: ℕ) (hn: n > 0) : abs (ω n) = 1 := sorry

theorem ω_pow (n: ℕ) (hn: n > 0) : ∀ k: ℕ, (ω n)^k = exp (2 * Real.pi * I * k / n) := sorry

def fft (a: Vector ℂ ) : Vector ℂ := Id.run do
  let n := a.size
  if n ≤ 1 then
    return a
  let m := n / 2
  let even ← fft a.extractEvens
  let odd ← fft a.extractOdds
  let result := Vector.mkEmpty n

  for k in [0:n] do
    if k < m then
      result := result.push (even[k] + Complex.exp (2 * Real.pi * Complex.I * (k : ℂ) / (n : ℂ)) * odd[k])
    else
      result := result.push (even[k-m] - Complex.exp (2 * Real.pi * Complex.I * ((k-m) : ℂ) / (n : ℂ)) * odd[k-m])
  return result

-- Helper functions
def Vector.extractEvens (v : Vector α) : Vector α :=
  v.filterWithIndex (fun i _ => i % 2 == 0)

def Vector.extractOdds (v : Vector α) : Vector α :=
  v.filterWithIndex (fun i _ => i % 2 == 1)

def Vector.mkEmpty (n: Nat) : Vector α := Vector.nil

-- proof
theorem fft_correct (a: Vector ℂ) : fft a = a := sorry
