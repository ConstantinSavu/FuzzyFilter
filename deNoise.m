## Copyright (C) 2022 Costi
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} deNoise (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Costi <Costi@DESKTOP-M4NJ8V0>
## Created: 2022-01-13

function J = deNoise (I)

[n, m] = size(I);
J = zeros(n, m);
error = 0.004;
s = 2;
ro_min = 5;

for i = [1:n]
  for j = [1:m]
    
    if( I(i, j) != 0 && I(i, j) != 1)
      J(i, j) = I(i, j);
      continue;
    endif
    H = 1;
    while (I(i, j) == 0 || I(i, j) == 1)
      
      if(i-H < 1 || i+H > n)
        J(i, j) = I(i, j);
        break;
      endif
      
      if(j-H < 1 || j+H > m)
        J(i, j) = I(i, j);
        break;
      endif
    
      q_lowerbound = i-H;
      q_upperbound = i+H;
      
      l_lowerbound = j-H;
      l_upperbound = j+H;
      
      P = I(q_lowerbound:q_upperbound, l_lowerbound:l_upperbound);
      
      [m1, m2, v] = get_means(P, s);
      gauss_membership = get_membership (P, m1, m2, v);
      
      upper_membership = get_upper_membership(P, gauss_membership, m1, m2);
      lower_membership = get_lower_membership(P, gauss_membership, m1, m2);
      
      [Th, Tl] = get_Thresholds([upper_membership; lower_membership]);
      
      delta_miu = (upper_membership + lower_membership) / 2;
      
      
      
      [n_P, m_P] = size(P);
      
      
      if(delta_miu((n_P + 1)/2, (m_P + 1)/2) >= Th)
        J(i, j) = I(i, j);
        break;
      endif
      
      #will compare to Tl instead of Th as it is written in the paper, because no pixel
      #will ever have an associated value in delta_miu > Th because Th is calculated as
      #the maximum value of the membership functions, and delta_miu has average values
      #of the lower and upper values, thus no pixel will ever have an associated valie > Th,
      #and all pixels will be labeled as bad.
      
      if(v <= error)
        I(i, j) = (m1 + m2)/2;
        J(i, j) = (m1 + m2)/2;
        break;
      endif
      
      T = (2*Tl + 3*Th) / 5;
      
      good_pixels = get_good_pixels(P, delta_miu, T);
      ro = length(good_pixels);
      
      if(ro <= ro_min)
        H += 1;
        continue;
      endif
      
      G_m = mean(good_pixels);
      G_v = get_variance(good_pixels, s);
      new_p = get_new_p (good_pixels, G_m, G_v);
      
      if(isnan(new_p))
        new_p = (m1 + m2)/2;;
      endif
      
      I(i, j) = new_p;
      J(i, j) = new_p;
      break;
    endwhile
    
  endfor
  progress = i/n * 100
endfor

endfunction
