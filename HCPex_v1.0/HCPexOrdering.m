function Reordered = HCPexOrdering(inputMat,direction)
% ReorderMat = HCPexOrdering(inputMat,direction)
%
% Input: inputMat,  Matrix (360x360 or 412x412) based on HCPMMP or HCPex
%        direction, old > new = 1; new > old = -1 
% 
% Output: ReorderMat, Reordered Matrix (412x412 or 360x360)
% 
% Note: HCPex_LabelID.mat is needed, assumed no subsitution or replacement
% for subcortical regions.
%
% Chu-Chung Huang, East China Normal University, 2020/03/18


tempMat = inputMat;
load('HCPex_LabelID.mat')
Ordering = cell2mat(LabelID(:,1:2));


switch direction
    case 1 % From old order to new order
        I = Ordering(1:360,2);
        tempMat=tempMat(I,I);
        
    case -1 % From new order to old order
        [~, I] = sort(Ordering(1:360,2));
        tempMat=tempMat(I,I);
end

ReorderMat = tempMat;