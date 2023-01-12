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
## @deftypefn {} {@var{retval} =} get_lower_membership (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Costi <Costi@DESKTOP-M4NJ8V0>
## Created: 2022-01-13

function lower_membership = get_lower_membership(P, gauss_membership, m1, m2)
  
  [n, m] = size(P);
  lower_membership = zeros(n, m);
  
  for i = [1:n]
    for j = [1:m]
      
      if(P(i, j) <= (m1 + m2)/2)
        lower_membership(i, j) = gauss_membership(i, j, 2);
      else
        lower_membership(i, j) = gauss_membership(i, j, 1);
      endif
    endfor
  endfor
  
endfunction
