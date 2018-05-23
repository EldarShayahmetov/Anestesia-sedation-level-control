function SavePNG()
[FileName, PathName, FilterIndex] = uiputfile('*.png', 'Save as:');
if ~ischar(FileName)
  disp('User aborted the dialog');
  return;
end
File = fullfile(PathName, FileName);
saveas(gcf,File,'png');
end