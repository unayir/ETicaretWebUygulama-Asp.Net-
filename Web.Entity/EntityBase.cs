﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Web.Entity
{
    public abstract class EntityBase
    {
        public abstract string PrimaryColumn { get; }
    }
}
