CREATE TABLE IF NOT EXISTS labtech (
  TechID INTEGER PRIMARY KEY,
  Init TEXT NOT NULL,
  FirstName TEXT NOT NULL,
  LastName TEXT NOT NULL,
  Organization TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS mixture (
  MixID INTEGER PRIMARY KEY,
  reactionVolume REAL DEFAULT NULL,
  Target TEXT DEFAULT NULL,
  PPmixDescription TEXT DEFAULT NULL,
  PPVolume REAL DEFAULT NULL,
  BSAVolume REAL DEFAULT NULL,
  DIH2OVolume REAL DEFAULT NULL,
  MasterMix TEXT DEFAULT NULL,
  MMVolume REAL DEFAULT NULL,
  MgClConc REAL DEFAULT NULL,
  MgClVolume REAL DEFAULT NULL,
  sampleVolume TEXT DEFAULT NULL
);
CREATE TABLE IF NOT EXISTS plate (
  PlateID INTEGER PRIMARY KEY,
  TimeStamp TEXT NULL DEFAULT NULL,
  Protocol TEXT DEFAULT NULL,
  TechID INTEGER unsigned DEFAULT NULL,
  FOREIGN KEY(TechID) REFERENCES labtech(TechID)
);
CREATE TABLE IF NOT EXISTS reaction (
  ReactionID INTEGER PRIMARY KEY,
  SampleID INTEGER NOT NULL,
  MixID INTEGER NOT NULL,
  Well TEXT NOT NULL,
  Content TEXT DEFAULT NULL,
  Cq TEXT NOT NULL,
  Quantifier TEXT DEFAULT NULL,
  QuantPerReaction REAL DEFAULT NULL,
  QuantPerFilter REAL DEFAULT NULL,
  log10QuantPerFilter REAL DEFAULT NULL,
  ND TEXT DEFAULT NULL,
  sk_Ct REAL DEFAULT NULL,
  sk_dct REAL DEFAULT NULL,
  Inhibition TEXT DEFAULT NULL,
  FOREIGN KEY(MixID) REFERENCES mixture(MixID),
  FOREIGN KEY(SampleID) REFERENCES sample(SampleID)
);
CREATE TABLE IF NOT EXISTS sample (
  SampleID INTEGER PRIMARY KEY,
  Sample TEXT NOT NULL,
  Project TEXT DEFAULT NULL,
  PlateID INTEGER NOT NULL,
  FOREIGN KEY(PlateID) REFERENCES plate(PlateID)
);
CREATE TABLE IF NOT EXISTS standard (
  StandardID INTEGER PRIMARY KEY,
  PlateID INTEGER NOT NULL,
  Target TEXT DEFAULT NULL,
  Slope REAL DEFAULT NULL,
  yint REAL DEFAULT NULL,
  r2 REAL DEFAULT NULL,
  Efficiency REAL DEFAULT NULL,
  Calibrator INTEGER DEFAULT NULL,
  FOREIGN KEY(PlateID) REFERENCES plate(PlateID)
);